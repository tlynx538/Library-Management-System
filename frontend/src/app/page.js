import Container from 'react-bootstrap/Container';
import Navbar from 'react-bootstrap/Navbar';
import {Row, Col} from 'react-bootstrap';
import Link from 'next/link'
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
import { RadioGroup, RadioGroupItem } from "@/components/ui/radio-group"
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";

import ButtonGroup from 'react-bootstrap/ButtonGroup';

export default function Home() {
  return (
      <div className='mx-auto'>
        <Navbar expand="lg" className="bg-body-tertiary mb-2">
          <Container>
            <Navbar>BiblioSphere</Navbar>
          </Container>
          <ButtonGroup aria-label="Basic example" className='mr-3'>
          <Button className='mr-1 bg-info'>Cart</Button>
          <Button className="mr-1 bg-warning" asChild>
            <Link href="/login" style={{ textDecoration: 'none' }}>Login</Link>
          </Button>
        </ButtonGroup>
        </Navbar>
        <Container>
          <Card>
            <CardHeader className='items-center'>
              <CardTitle>Search the Library</CardTitle>
              <CardDescription>Literally for Anything!</CardDescription>
              <Row md="auto" className="p-2" align="center">
                <Col>
                  <Input style={{ width: '500px'}} placeholder="Find books, articles, library services and more."></Input>
                </Col>
                <Col sm>
                  <Button>Search</Button>
                </Col>
              </Row>
            </CardHeader>
          </Card>
        </Container>
        <Container>
          <Row className='mt-3 gx-0'>
          <Col sm={4}>
            <Container>
              <Card>
                <CardHeader>
                  <CardTitle className='mb-3'>Search Filters</CardTitle>
                  <Label>Author</Label>
                  <Select>
                    <SelectTrigger id="framework">
                      <SelectValue placeholder="Select" />
                    </SelectTrigger>
                  <SelectContent position="popper">
                    <SelectItem value="next">Next.js</SelectItem>
                    <SelectItem value="sveltekit">SvelteKit</SelectItem>
                    <SelectItem value="astro">Astro</SelectItem>
                    <SelectItem value="nuxt">Nuxt.js</SelectItem>
                  </SelectContent>
                  </Select>
                  <Label className="mt-2">Resource Type</Label>
                  <Select>
                    <SelectTrigger id="framework">
                      <SelectValue placeholder="Select" />
                    </SelectTrigger>
                  <SelectContent position="popper">
                    <SelectItem value="next">Next.js</SelectItem>
                    <SelectItem value="sveltekit">SvelteKit</SelectItem>
                    <SelectItem value="astro">Astro</SelectItem>
                    <SelectItem value="nuxt">Nuxt.js</SelectItem>
                  </SelectContent>
                  </Select>
                  <Label className="mt-2">Genre</Label>
                  <Select>
                    <SelectTrigger id="framework">
                      <SelectValue placeholder="Select" />
                    </SelectTrigger>
                  <SelectContent position="popper">
                    <SelectItem value="next">Next.js</SelectItem>
                    <SelectItem value="sveltekit">SvelteKit</SelectItem>
                    <SelectItem value="astro">Astro</SelectItem>
                    <SelectItem value="nuxt">Nuxt.js</SelectItem>
                  </SelectContent>
                  </Select>
                  <Label className="mt-3">Availability</Label>
                  <RadioGroup defaultValue="option-one">
                  <div className="flex items-center space-x-2">
                    <RadioGroupItem value="option-one" id="option-one" />
                    <Label htmlFor="option-one">Available to Borrow</Label>
                  </div>
                  <div className="flex items-center space-x-2">
                    <RadioGroupItem value="option-two" id="option-two" />
                    <Label htmlFor="option-two">Under Reservation</Label>
                  </div>
                  <div className="flex items-center space-x-2">
                    <RadioGroupItem value="option-three" id="option-three" />
                    <Label htmlFor="option-three">Upcoming</Label>
                  </div>
                </RadioGroup>
                </CardHeader>
              </Card>
            </Container>
          </Col>
          <Col lg>
            <Container>
              <Card>
                <CardHeader>
                  <CardTitle>Your Search result returned 05 results</CardTitle>
                  <Container style={{overflowY: "auto", maxHeight:"400px"}}>
                    <Col className='p-3'>
                      <Card className="mb-1">
                        <CardHeader>
                          <CardTitle>Book 1</CardTitle>
                          <Label>Lorem Ipsum</Label>
                          <CardDescription>Description of Book 1</CardDescription>
                        </CardHeader>
                        <CardFooter>
                          <Button>View Details</Button>
                        </CardFooter>
                      </Card>
                      <Card className="mb-1">
                        <CardHeader>
                          <CardTitle>Book 2</CardTitle>
                          <Label>Lorem Ipsum</Label>
                          <CardDescription>Description of Book 2</CardDescription>
                        </CardHeader>
                        <CardFooter>
                          <Button>View Details</Button>
                        </CardFooter>
                      </Card>
                      <Card className="mb-1">
                        <CardHeader>
                          <CardTitle>Book 3</CardTitle>
                          <Label>Lorem Ipsum</Label>
                          <CardDescription>Description of Book 3</CardDescription>
                        </CardHeader>
                        <CardFooter>
                          <Button>View Details</Button>
                        </CardFooter>
                      </Card>
                      <Card className="mb-1">
                        <CardHeader>
                          <CardTitle>Book 4</CardTitle>
                          <Label>Lorem Ipsum</Label>
                          <CardDescription>Description of Book 4</CardDescription>
                        </CardHeader>
                        <CardFooter>
                          <Button>View Details</Button>
                        </CardFooter>
                      </Card>
                      <Card className="mb-1">
                        <CardHeader>
                          <CardTitle>Book 5</CardTitle>
                          <Label>Lorem Ipsum</Label>
                          <CardDescription>Description of Book 5</CardDescription>
                        </CardHeader>
                        <CardFooter>
                          <Button>View Details</Button>
                        </CardFooter>
                      </Card>
                    </Col>
                  </Container>
                </CardHeader>
              </Card>
            </Container>
          </Col>
          </Row>
        </Container>
      </div>
  );
}
