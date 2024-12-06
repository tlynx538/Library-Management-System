import Container from 'react-bootstrap/Container';
import Navbar from 'react-bootstrap/Navbar';
import {Row, Col} from 'react-bootstrap';

import {
  Card,
  CardContent,
  CardDescription,
  CardFooter,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";

import { Input } from '@/components/ui/input';
import { Button } from '@/components/ui/button';
import { Label } from '@/components/ui/label';
import Link from 'next/link'

export default function Login (){
    return(
        <div style={{display: 'flex', justifyContent: 'center', alignItems: 'center', height: '100vh', backgroundColor: '#f9f9f9'}}>
            <Container style={{maxWidth: '300px'}}>
              <Card>
                <CardHeader>
                  <h4 align="center">BiblioSphere</h4>
                  <hr></hr>
                  <CardTitle className='mt-3'>Username</CardTitle>
                  <Input></Input>
                  <CardTitle>Password</CardTitle>
                  <Input></Input>
                  <Button style={{maxWidth: '100px'}} className='mb-3 mt-3'>Sign In</Button>
                  <hr></hr>
                  <Label>Don't have an account?</Label>
                  <Link href="/">Sign Up</Link>
                </CardHeader>
              </Card>
            </Container>
        </div>
    );
}  